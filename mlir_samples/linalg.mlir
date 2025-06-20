#map = affine_map<(d0, d1) -> (0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @main(%arg0: tensor<1x10xf32>) -> tensor<1x5xf32> {
    %cst = arith.constant dense_resource<torch_tensor_20_10_torch.float32> : tensor<20x10xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant dense_resource<torch_tensor_5_20_torch.float32> : tensor<5x20xf32>
    %0 = tensor.empty() : tensor<10x20xf32>
    %transposed = linalg.transpose ins(%cst : tensor<20x10xf32>) outs(%0 : tensor<10x20xf32>) permutation = [1, 0] 
    %1 = tensor.empty() : tensor<1x20xf32>
    %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<1x20xf32>) -> tensor<1x20xf32>
    %3 = linalg.matmul ins(%arg0, %transposed : tensor<1x10xf32>, tensor<10x20xf32>) outs(%2 : tensor<1x20xf32>) -> tensor<1x20xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%3 : tensor<1x20xf32>) outs(%1 : tensor<1x20xf32>) {
    ^bb0(%in: f32, %out: f32):
      %9 = arith.cmpf ugt, %in, %cst_0 : f32
      %10 = arith.select %9, %in, %cst_0 : f32
      linalg.yield %10 : f32
    } -> tensor<1x20xf32>
    %5 = tensor.empty() : tensor<20x5xf32>
    %transposed_2 = linalg.transpose ins(%cst_1 : tensor<5x20xf32>) outs(%5 : tensor<20x5xf32>) permutation = [1, 0] 
    %6 = tensor.empty() : tensor<1x5xf32>
    %7 = linalg.fill ins(%cst_0 : f32) outs(%6 : tensor<1x5xf32>) -> tensor<1x5xf32>
    %8 = linalg.matmul ins(%4, %transposed_2 : tensor<1x20xf32>, tensor<20x5xf32>) outs(%7 : tensor<1x5xf32>) -> tensor<1x5xf32>
    return %8 : tensor<1x5xf32>
  }
}

{-#
  dialect_resources: {
    builtin: {
      torch_tensor_20_10_torch.float32: "0x04000000700774BE578E82BEAC809DBEF1BA16BEEC2A933DE4BF3C3EC19D37BD19B425BDEBC466BEFF0BE13DA50183BEDA00963ECE21343E0AD18DBE8DBB693E7D3C9C3CA3309D3DE65492BE858C223E0A9F3CBE8CF89EBE8C26DF3DDD030C3E3DC0F03DC06D903E07670D3D7800A03D07AD0E3EA23C573C33F96DBD65BE863EE0BB443ECBD869BE958F9DBD2359DBBD807E633EF19444BE4E8382BE75A9FE3DFAEA5BBDEE21803DC2FF46BE53EA973C1827513EE81E8BBE2D7B45BEEAF2B0BC08969EBDCCF396BE58D29F3E143F88BE260691BD78A7CCBD2345F23D8C1D24BD98ACBDBDB37CECBCF2A4933E5191F3BD7EF6D0BDCC42963DEAA05ABDEA0C123D332BC03DB56D0A3D1615693E6870963E6919E03B856A893E106F66BDF97F5E3E55D92D3EE36D37BD48EF64BCB8965F3E057E5ABE2F3291BD4FB3DCBD3B45273E58A8603BC056CF3C655C643B1F7094BD8E05093EF13F5DBE52F2B3BD247CAB3D63823B3D68E73FBCB41A933ED009193E62516F3E168D27BED78B443E824B27BEDB3303BD4574643EAE9D04BED70AF3BD740049BE8AA86BBEF029EEBD9896C63C70E4353EB31E92BD50D074BE0218C03DC8916BBD9FE066BE43D70F3EDF0414BE813E59BDAA6592BEEEB4F33DC39E10BE72E387BDE88C053EB06C0DBEAD3DD03DA172F43BA98EBB3D01E86D3D6EBFA0BD1A3664BE1C93993EACF62DBE946D8DBE763F733E48B662BEF441263EA6198B3ED8AC87BE28324ABED43DA13EAE3A5E3ED578833C7958D6BBA5A170BE29A84ABE563976BE48EC34BE7680D03DAEC193BE8DD0493EE7453A3EA7C2C0BD2A2076BEC2DF073ECEF94ABE60F6773E1CCF7BBE6C7B933D59D40EBEFEEE063EF68E97BE640DB9BDDE7411BEB235C4BD4E575A3EA5B3D9BDA7A38CBE3E90F23DD31AC83DD99945BD6F0083BE593965BE0AAA9B3E2C2901BE8721BFBD04A7733D41C8823E50F590BEA35C55BD908BA23DFD65223C3FED543DDB0948BE3F92C6BBE3888C3E4939793DEF89073D52B478BE618862BE20295FBE950BBBBDC8F02B3E69F896BBDD767B3E307384BDE0B4583ED27AD23D0645593EDAF29F3ED100BFBD6E0F9FBE58422D3E3460363ED3944B3D8BCED93C301E69BC",
      torch_tensor_5_20_torch.float32: "0x040000004B1B5DBD5F5C533ECB9785BD3C148FBDFD3BE1BDB8293C3E7A9BAF3D8A27263EB405EE3DF6A495BD30ED51BEC6A8693D8E42073EB2E7F3BDEE2E283C71190D3B16AAE1BDB533493E7DDED53D0158443EBFDECA3C324DF9BDCF2F0C3EF5AFC33D2A43AFBD4B32DB3D975B62BD2392483EB1B44CBEDF89043D387BBEBCBAA1F53D30793BBEAD164B3DC0C3E43D7DDB7E3DC53D3A3E374346BE05CB373EC3F6DC3D2C1D613CB4C6AFBD039240BE91EF42BEB33A1ABB803C20BD9FE3313D15D6D93D4DB708BD2A49E63D33A991BD42328BBCB65B393EE24907BED38BDDBDDEEBEFBCB89757BE13FF503EFC9029BE20AE00BEF809D1BCDB371E3D6457033E4677D33DAC53D73DE039923DF7952D3EBE721E3E8237353DF35D0CBC41319B3D9DCACCBD9217BBBC309940BE4EB0B2BD1BD3D13CE9CC673D636E43BE4E32963C2F5E2ABEC8BA913C4BC338BDF54FE03CFF0007BEB7E21C3E8FB4C5BCCACC24BD59B20ABE591AB23D95141FBDB51C313E1C2C9ABC4E9B62BEEC06313D5A772D3E1EA1AD3CFE21FEBDF3BAA93DC584123E81428EBD"
    }
  }
#-}
