```shell
$ cd mockturtle
$ mkdir build && ninja -C build emap
# Add abc, emap to PATH
export PATH=<path_to_abc>:build/experiments:$PATH
$ ./build/experiments/emap circt.aig
[i] processing technology library `multioutput`
[i] Loading 48 simple library cells
[i] Loading 2 multi-output library cells
[i] processing circt.aig
[i] dataset b2ce7f0
|       benchmark | size | area_after | depth | delay_after | multioutput | runtime |  cec |
| circt.aig | 1301 |     139.31 |    36 |      408.78 |           6 |    0.37 | true |
$ ./build/experiments/emap yosys.aig
[i] processing technology library `multioutput`
[i] Loading 48 simple library cells
[i] Loading 2 multi-output library cells
[i] processing /yosys.aig
[i] dataset b2ce7f0
|       benchmark | size | area_after | depth | delay_after | multioutput | runtime |  cec |
| yosys.aig | 1148 |     107.77 |    41 |      445.40 |          21 |    0.23 | true |

# Mapped Verilog is here
$ cat circt.aig_mapped.v
$ cat yosys.aig_mapped.v

# To compare the results. Need circt-* in PATH
$ ./compare.sh fmaa.comb.mlir

```
