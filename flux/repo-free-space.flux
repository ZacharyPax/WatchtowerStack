from(bucket: "data")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "veeam_vbr_repositories")
  |> filter(fn: (r) => r["_field"] == "veeamVBRRepoFree")
  |> filter(fn: (r) => r["veeamVBRMSDescription"] == "REDACTED" or r["veeamVBRMSDescription"] == "REDACTED2")
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")
