# Reopen File to add a diff calculator for investigating byte differences between fixtures and created files.
class File
  # Checks if two files contain the same contents. Prints and returns a
  # position and values of differences, or returns nil if there were no
  # differnces.
  def File.same_contents(p1, p2)
    f1 = open(p1).read
    f2 = open(p2).read
    
    # Control variables
    differences = []
    read_length = 1
    same = true
    index = 0
    
    while ((index + read_length) < f1.length) && ((index + read_length) < f2.length)
      same = f1.slice(index, read_length) == f2.slice(index, read_length)
      unless same
        puts index 
        pp f1.slice(index, read_length).unpack("C*")
        pp f2.slice(index, read_length).unpack("C*")
        differences << {:index => index, 
          :f1_value => f1.slice(index, read_length).unpack("C*"),
          :f2_value => f2.slice(index, read_length).unpack("C*")
        }
      end
      index = index + read_length
      differences
    end
  end
end

# # Original comparison from Ruby Cookbook by Carlson & Richardson
# open(p1) do |f1|
#   open(p2) do |f2|
#     puts blocksize = f1.lstat.blksize
#     same = true
#     while same && !f1.eof? && !f2.eof?
#       same = f1.read(blocksize) == f2.read(blocksize)
#     end
#     return same
#   end
# end
