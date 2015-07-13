.PHONY = all clean

jekyll_dir = build/jekyll
menu = menu
posts = network

posts:
	puborg -j menu -o $(jekyll_dir)
	puborg -p $(posts)

latex:
	puborg -l $(posts)

all: posts latex

clean:
	puborg -c $(menu) $(posts)
