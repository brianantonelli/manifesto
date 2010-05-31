require File.dirname(__FILE__) + '/spec_helper'

module ManifestoSpecHelper
  def manifest
    ["CACHE MANIFEST\n",
     "# Generated by manifesto (http://github.com/johntopley/manifesto)\n",
     "# Hash: 6d13b82dfa131827144aa6b32ab06331\n", "/file1.txt\n", "/file2.txt\n", "/README.txt\n"]
  end
end

describe Manifesto do
  include ManifestoSpecHelper
  
  it "should raise ArgumentError if directory is not a real directory" do
    expect{ Manifesto.validate_arguments('', false) }.to raise_error(ArgumentError)
  end
  
  it "should raise ArgumentError if compute_hash is not a boolean" do
    expect{ Manifesto.validate_arguments('.', nil) }.to raise_error(ArgumentError)
  end
  
  it "should return a list of files within the default directory" do
    Manifesto.cache.should eql(manifest)
  end
  
  it "should return a list of files within the specified directory" do
    Manifesto.cache(:directory => './spec/fixtures').should eql(manifest)
  end
  
  it "should compute a hash of the files within the default directory"
  
  it "should compute a hash of the files within the specified directory"
  
  it "shouldn't include hidden files or directories within the default directory"
  
  it "shouldn't include hidden files or directories within the specified directory"
end