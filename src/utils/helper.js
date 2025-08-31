// Returns the %CPU as a String, needs previous iteration /proc/stat and current iteration /proc/stat
// Inspired by: https://www.idnt.net/en-US/kb/941772
function getCpuUsage(prevStat, currStat) {

  // Column 	Name 	    Description 
  // 0        n/a       cpu identifier
  // 1 	      user 	    Time spent with normal processing in user mode.
  // 2 	      nice 	    Time spent with niced processes in user mode.
  // 3 	      system 	  Time spent running in kernel mode.
  // 4 	      idle 	    Time spent in vacations twiddling thumbs.
  // 5 	      iowait 	  Time spent waiting for I/O to completed. This is considered idle time too. 	since 2.5.41
  // 6 	      irq 	    Time spent serving hardware interrupts. See the description of the intr line for more details. 	since 2.6.0
  // 7 	      softirq 	Time spent serving software interrupts. 	since 2.6.0
  // 8 	      steal 	  Time stolen by other operating systems running in a virtual environment. 	since 2.6.11
  // 9 	      guest 	  Time spent for running a virtual CPU or guest OS under the control of the kernel. 	since 2.6.24
  var prevArray = getCpuTimeArray(prevStat);
  var currArray = getCpuTimeArray(currStat);

  var prevSum = getCpuTimeSum(prevArray);
  var currSum = getCpuTimeSum(currArray);
  var cpuDelta = currSum - prevSum;
  var idleDelta = currArray[4] - prevArray[4];
  var cpuUsed = cpuDelta - idleDelta;
  var cpuUsage = cpuUsed / cpuDelta * 100;
  return isNaN(cpuUsage) ? 0 : cpuUsage.toFixed(0);
}

function getCpuTimeArray(raw) {
  return raw.trim().slice(0, raw.indexOf("cpu0")).replace(/\s+/, " ").split(" ");
}

function getCpuTimeSum(cpuTimeArray) {
  var sum = 0;
  for (var i = 1; i < 10; i++) {
    sum += parseInt(cpuTimeArray[i]);
  }
  return sum;
}

// Returns Memory usage in percent from the raw string provided (/proc/meminfo)
// 2 -> MemAvailable
function getMemUsage(meminfo) {
  var parsedMemory = meminfo.trim().split("\n").map(line => {
    const [key, value, unit] = line.trim().split(/\s+/)
    return { key: key.replace(":", ""), value: Number(value), unit }
  })

  var memAvailable = parsedMemory[2].value;
  var memTotal = parsedMemory[0].value;
  var memUsed = memTotal - memAvailable;
  var memUsage = memUsed / parsedMemory[0].value * 100;
  return isNaN(cpuUsage) ? 0 : memUsage.toFixed(0);
}
