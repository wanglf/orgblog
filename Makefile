.PHONY: all clean slide

menu_dir = /var/www/www.wanglifeng.info/menu
jekyll_dir = /var/www/www.wanglifeng.info
reveal_dir = $(abspath /var/www/www.wanglifeng.info/reveal)

menu = menu
posts = editor network sysadmin tools language linux books
#slide = linux

menupages:
	puborg -n -j $(menu) -o $(menu_dir)

posts:
	puborg -n -j $(menu) -o $(menu_dir)
	puborg -p $(posts)

latex:
	puborg -l $(posts)

beamer:
	cd slide && puborg -l $(slide)

slide:
	cd slide && puborg -o $(reveal_dir) -r $(slide)

all: slide posts latex beamer

clean:
	puborg -c $(menu) $(posts)
	cd slide && puborg -c $(slide)

rmsitecontent: 
	puborg -c $(menu) $(posts)
	cd slide && puborg -c $(slide)
	rm -rf /var/www/www.wanglifeng.info/_posts/
	rm -rf /var/www/www.wanglifeng.info/_site/
