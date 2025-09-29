DATA=DatapathBench/benchmarks

./compare.sh $DATA/fma_share/mlir/fma_share.comb.mlir
./compare.sh $DATA/fmaa/mlir/fmaa.comb.mlir
./compare.sh $DATA/fma/mlir/fma.comb.mlir
./compare.sh $DATA/blend/mlir/blend.comb.mlir
./compare.sh $DATA/add_three/mlir/add_three.comb.mlir
./compare.sh $DATA/dot_product/mlir/dot_product.comb.mlir
