def pmu_format!(race_array)
  #TODO: modify the given array so that it is PMU-consistent
  race_array.sort!.reverse!.map!{|poney| "#{race_array.length - race_array.index(poney)}-" + poney + "!"}
end



