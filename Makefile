# look up slides, lesson number and handouts in Jekyll _config.yml
SLIDES := $(shell ruby -e "require 'yaml';puts YAML.load_file('docs/_config.yml')['slide_sorter']")
LESSON := $(shell ruby -e "require 'yaml';puts YAML.load_file('docs/_config.yml')['lesson']")
HANDOUTS := $(shell ruby -e "require 'yaml';puts YAML.load_file('docs/_config.yml')['handouts']")

# list available RMarkdown slides and data
SLIDES_RMD := $(shell find . -path "./docs/_slides_Rmd/*.Rmd")
DATA := $(shell find . -path "./data/*")

# make target "course" copies handouts to ../../
# adding a lesson number to any "worksheet"
HANDOUTS := $(addprefix ../../, $(HANDOUTS:worksheet%=worksheet-$(LESSON)%))
DATA := $(addprefix ../., $(DATA))

# do not run rules in parallel; because
# - bin/build_slides.R runs over all .Rmd slides
# - rsync -r only needs to run once
.NOTPARALLEL:
.DEFAULT_GOAL: slides
.PHONY: course lesson slides

# this target exists for building .md slides
# without commit and push 
slides: $(SLIDES:%=docs/_slides/%.md)

$(subst _Rmd,,$(SLIDES_RMD:.Rmd=.md)): $(SLIDES_RMD)
	@bin/build_slides.R

# this target updates the lesson repo
# on GitHub following a slide build
lesson: slides
	if [ -n "$$(git status -s)" ]; then git commit -am 'commit by make'; fi
	git fetch upstream master:upstream
	git merge --no-edit upstream
	git push

# this target inserts into handouts repo
# with root assumed to be at ../
course: lesson $(DATA) $(HANDOUTS)

../../data/%: data/%
	rsync -r data/ ../../data/

../../worksheet-$(LESSON)%: worksheet%
	cp $< $@

$(filter-out ../../worksheet%, $(HANDOUTS)): ../../%: %
	cp $< $@
