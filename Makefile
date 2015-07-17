.PHONY: all clean slide

menu_dir = build/jekyll/menu
jekyll_dir = build/jekyll
reveal_dir = $(abspath build/reveal)

menu = menu slide
posts = algorithm network language linux
slide = linux

posts:
	puborg -n -j $(menu) -o $(menu_dir)
	puborg -p $(posts)

latex:
	puborg -l $(posts)

slide:
	cd slide && puborg -o $(reveal_dir) -r $(slide)

all: slide posts latex

clean:
	puborg -c $(menu) $(posts)
	cd slide && puborg -c $(slide)
