EN | [中文](ontfs_bench.md)

# ONTFS Test Benchmarks

## Testing Environment

| Parameter | Value                                    |
| --------- | ---------------------------------------- |
| CPU       | Intel(R) Core(TM) i7-5500U CPU @ 2.40GHz |
| Memory    | 8G                                       |
| Bandwidth | 1MB/s                                    |

## Upload

`dd if=/dev/zero of=output.dat  bs=1M  count=1` and `dd if=/dev/zero of=output.dat  bs=1M  count=2` are used separately to generate temporary `1M/2M` files to be uploaded. 10 upload times were recorded as follows:


| File Size | Upload Times                                                                   | Average Time |
| --------- | ------------------------------------------------------------------------------ | ------------ |
| 1M        | 9.823s 9.804s 10.083s 8.890s 9.923s 10.061s 8.592s 10.564s 8.709s 8.557s       | 9.5006s      |
| 2M        | 9.950s 13.124s 11.520s 11.628s 12.414s 11.470s 11.481s 11.602s 11.454s 12.663s | 11.73s       |

## Download

Different `1M/2M` files were downloaded. The download times recorded are as follows:

| File Size | Upload Times                                                                    | Average Time |
| --------- | ------------------------------------------------------------------------------- | ------------ |
| 1M        | 11.776s 10.993s 7.989s 13.093s 11.910s 11.893s 11.015s 12.804s 11.903s 11.308s  | 11.47s       |
| 2M        | 13.496s 17.004s 13.713s 14.412s 13.404s 13.400s 13.400s 13.411s 13.412s 13.398s | 13.90s       |
