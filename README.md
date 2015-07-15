# unjava

The default recipe of this cookbook will monkey patch your run list to prevent the installation of openjdk 6 due to a recipe earlier in the run list including recipe `java::default`. The community java cookbook is awesome! The assumption that you want the default recipe included in your run list is not!
