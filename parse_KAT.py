


print("unsigned char gimli_KAT[2*100*48] = {")
with open('hw-gimli/data_tests/gimli_permutation.dat', "r") as fp:
    assert(fp.readline()=="100\n")
    for i in range(200):
        print(",".join(map(lambda x: str(x),list(int(fp.readline(),2).to_bytes(384//8,'little')))) + ",")
    print("};")

   

