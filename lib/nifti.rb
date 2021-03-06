$: << File.dirname(__FILE__)

# Loads the files that are used by Ruby NIFTI.
#
# The following classes are meant to be used by users of Ruby DICOM:
# * NObject - for reading, manipulating and writing DICOM files.

# NIFTI is the main namespace for all Ruby NIfTI classes, constants and methods.
module NIFTI; end

# Core library:
require 'nifti/n_object'
require 'nifti/n_read'
require 'nifti/n_write'
require 'nifti/n_image'
require 'nifti/stream'
require 'nifti/constants'

begin
  require 'narray'
rescue LoadError => e
  puts "NArray required for some image visualization options."
  puts "Run 'gem install narray' or 'bundle install' to get it."
end