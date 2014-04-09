def pmu_format!(race_array)
  #TODO: modify the given array so that it is PMU-consistent
  race_array.sort!.reverse!.map!.with_index{|poney, i| "#{race_array.length - i}-" + poney + "!"}
end



