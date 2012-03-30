class SFBallotParse
  attr_reader :candidates

  def initialize(source_dir_relative_path)
    @source_dir_relative_path = source_dir_relative_path
    set_candidates
  end
  
  private
  
  def set_candidates
    @candidates = read_candidates
  end
  
  def read_candidates
    File.open(master_lookup) do |file|
      file.map do |line|
        line[17,50].rstrip
      end
    end
  end

  def this_dir
    File.dirname(__FILE__)
  end

  def source_dir_path
    File.join(this_dir, @source_dir_relative_path)
  end

  def master_lookup_glob
    File.join(source_dir_path, '*-MasterLookup.txt')
  end
    
  def master_lookup
    Dir.glob(master_lookup_glob).first
  end
end