ARGS=[]
unless ARGS.length == 2
  puts "Dude, not the right number of arguments."
  puts "Usage: ruby MyScript.rb InputFile.csv SortedOutputFile.csv\n"
  exit
end
