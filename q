
[1mFrom:[0m /home/huffjd1-70879/code/inspiro/lib/inspiro/cli.rb @ line 20 Inspiro::CLI#menu:

    [1;34m11[0m: [32mdef[0m [1;34mmenu[0m
    [1;34m12[0m:   choice = [1;36mnil[0m
    [1;34m13[0m:   puts [31m[1;31m"[0m[31m[1;31m"[0m[31m[0m
    [1;34m14[0m:   puts [31m[1;31m"[0m[31mPlease select 1 for Videos, 2 for Articles, and 3 for Quotes[1;31m"[0m[31m[0m
    [1;34m15[0m:   puts [31m[1;31m"[0m[31mYou can exit at any time by entering exit[1;31m"[0m[31m[0m
    [1;34m16[0m:   puts [31m[1;31m"[0m[31m[1;31m"[0m[31m[0m
    [1;34m17[0m:   puts [31m[1;31m"[0m[31mHow would you like to be inspired today?[1;31m"[0m[31m[0m
    [1;34m18[0m:   choice = gets.strip
    [1;34m19[0m:     [32mif[0m choice.to_i == [1;34m1[0m
 => [1;34m20[0m:       binding.pry
    [1;34m21[0m:       [1;34;4mInspiro[0m::[1;34;4mScraper[0m.scrape_video_page
    [1;34m22[0m:       menu
    [1;34m23[0m:     [32melsif[0m choice.to_i == [1;34m2[0m
    [1;34m24[0m:       [1;34;4mInspiro[0m::[1;34;4mScraper[0m.new.scrape_articles
    [1;34m25[0m:       menu
    [1;34m26[0m:     [32melsif[0m choice.to_i == [1;34m3[0m
    [1;34m27[0m:       [1;34;4mInspiro[0m::[1;34;4mScraper[0m.new.scrape_quotes
    [1;34m28[0m:       menu
    [1;34m29[0m:     [32melsif[0m choice.downcase == [31m[1;31m"[0m[31mexit[1;31m"[0m[31m[0m
    [1;34m30[0m:       goodbye
    [1;34m31[0m:       exit
    [1;34m32[0m:     [32melse[0m
    [1;34m33[0m:       puts [31m[1;31m"[0m[31mI'm not sure what you'd like to see. Please select a number from 1-3[1;31m"[0m[31m[0m
    [1;34m34[0m:       menu
    [1;34m35[0m:     [32mend[0m
    [1;34m36[0m:   [32mend[0m

