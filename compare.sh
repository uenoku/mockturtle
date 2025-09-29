# Take mlir and compare the results of emap with area-oriented mapping and delay-oriented mapping

# Usage: ./compare.sh <mlir file>
# Example: ./compare.sh fma_share.comb.mlir

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <mlir file>"
    exit 1
fi

mlir_file=$1
base_name=$(basename "$mlir_file" .mlir)
# Direct emission of aiger
# circt-synth "$mlir_file" -convert-to-comb | circt-translate --export-aiger -o "${base_name}_circt.aig"
circt-synth "$mlir_file" -convert-to-comb | circt-opt -export-verilog -o /dev/null > "${base_name}_circt.sv"
yosys -p "read_verilog ${base_name}_circt.sv; hierarchy; synth; aigmap; write_aiger ${base_name}_circt.aig"
circt-opt -export-verilog "$mlir_file" -o /dev/null > "${base_name}.sv"
yosys -p "read_verilog ${base_name}.sv; hierarchy; synth; aigmap; write_aiger ${base_name}_yosys.aig"

emap "${base_name}_circt.aig"
emap "${base_name}_yosys.aig"
