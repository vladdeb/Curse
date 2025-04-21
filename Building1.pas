unit Building1;

interface
uses
  Maps;

implementation

var
  mapFile: array[1..4] of TmapFile;
  graphFile: TgraphFile;
  Vertex: TVertexFixed;
  distx, disty:Integer;

initialization
  //1ST BUILDING AUDITORY CORDS
  SetLength(BSUIR[0], 5);
  //1ST BUILDING 1ST FLOOR
  SetLength(Bsuir[0][1], 0);
  AddAud(BSUIR[0][1], TAuditory.Create(85, 133,  101, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 241,  102, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 173,  103, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 281,  104, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 206,  105, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 362,  107, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(32, 435,  109, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(287, 435, 110, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(121, 435, 111, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(361, 435, 112, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(428, 435, 114, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(183, 435, 115, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(703, 435, 116, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(253, 435, 117, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(214, 435, 118, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(359, 435, 119, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(844, 435, 120, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(806, 435, 121, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(947, 435, 122, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(845, 435, 123, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(989, 435, 124, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(912, 435, 125, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1024,435, 126, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(947, 435, 127, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,285, 128, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(985, 435, 129, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,209, 130, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1024,435, 131, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1070,435, 133, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1110,435, 135, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,435, 137, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,364, 139, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,252, 141, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117,131, 143, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117, 30, 145, ' ', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85,   435,  199, 'Anglel', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117, 435,  199, 'Angler', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(600,  489,  199, 'Exit', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(600,  435,  199, 'Ladderc1', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(600,  378,  199, 'Ladderc2', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(85, 174,    199, 'Ladderl1', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(120, 174,   199, 'Ladderl2', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1117, 174,  199, 'Ladderr1', 1));
  AddAud(BSUIR[0][1], TAuditory.Create(1077, 174,  199, 'Ladderr2', 1));


  //1st BUILDING 2ND FLOOR
  SetLength(Bsuir[0][2], 0);

  AddAud(BSUIR[0][2], TAuditory.Create(81, 66,  201, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 136, 201, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 136, 201, 'á', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 66,  201, 'ã', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 136, 202, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 172, 203, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 249, 203, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 212, 203, 'á', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 292, 204, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 370, 205, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 327, 205, 'á', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 282, 205, 'â', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(180,438, 206, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(143,438, 206, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 438, 207, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(223,438, 208, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(184,438, 209, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(259,438, 210, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(286,438, 210, 'á', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(325,438, 210, 'â', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(255,438, 211, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(364,438, 212, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(286,438, 213, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(326,438, 213, 'à', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(355,438, 215, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(500,438, 216, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(465,438, 217, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(666,438, 218, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(703,438, 219, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(808,438, 220, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(771,438, 221, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(808,438, 223, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1024,438,224, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(915,438, 225, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,249,226, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1024,438,227, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1069,438,229, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,366,231, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118, 25,232, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,330,233, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,293,235, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,179,237, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118,143,239, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118, 25,241, ' ', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81,   438,  299, 'Anglel', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118, 438,  299, 'Angler', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(600,  438,  299, 'Ladderc1', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(600,  378,  299, 'Ladderc2', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(81, 174,    299, 'Ladderl1', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(120, 174,   299, 'Ladderl2', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1118, 174,  299, 'Ladderr1', 1));
  AddAud(BSUIR[0][2], TAuditory.Create(1077, 174,  299, 'Ladderr2', 1));

  //3RD FLOOR 1ST BUILDING
  SetLength(Bsuir[0][3], 0);

  AddAud(BSUIR[0][3], TAuditory.Create(111, 21,  300, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(105, 134, 301, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(107, 97,  301, 'á', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(105, 134, 302, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(102, 167, 303, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(97,  274, 304, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(100, 203, 305, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(187, 425, 306, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(96,  246, 307, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(229, 425, 308, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(91,  350, 309, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(263, 425, 310, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(136, 425, 311, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create( 88, 425, 311, 'á', 1));
  AddAud(BSUIR[0][3], TAuditory.Create( 40, 425, 311, 'â', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(294, 425, 312, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(191, 425, 313, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(367, 425, 314, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(231, 425, 315, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(295, 425, 317, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(507, 425, 318, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(366, 425, 319, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(738, 430, 320, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(470, 428, 321, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(809, 430, 322, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(847, 430, 324, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(914, 430, 326, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(948, 430, 328, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(704, 430, 329, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(739, 430, 329, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(986, 430, 330, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(777, 430, 331, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1026, 435,332, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(878, 435, 333, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(985, 425, 333, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 289,334, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 215,336, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 435,337, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1072, 435,337, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 147,338, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1161, 435,339, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 34, 340, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 290,343, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 256,345, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 147,347, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 181,347, 'à', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115,  33,349, ' ', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(88,   425,399, 'Anglel', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 435,399, 'Angler', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(600,  430,399, 'Ladderc1', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(600,  378,399, 'Ladderc2', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(104, 167,399, 'Ladderl1', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(120, 167,399, 'Ladderl2', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1115, 179,399, 'Ladderr1', 1));
  AddAud(BSUIR[0][3], TAuditory.Create(1077, 179,399, 'Ladderr2', 1));


  //4TH FLOOR 1ST BUILDING
  SetLength(Bsuir[0][4], 0);

  AddAud(BSUIR[0][4], TAuditory.Create( 82, 25,  400, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,143,  401, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,143,  402, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,175,  403, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,286,  404, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,213,  405, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(214,432,  406, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create( 82,360,  407, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(287,432,  408, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(131,432,  409, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(358,432,  410, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(181,432,  411, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(425,432,  412, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(216,432,  413, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(531,432,  414, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(458,432,  414, 'á', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(214,432,  415, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(321,432,  415, 'à', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(732,432,  416, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(460,432,  417, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(838,432,  418, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(528,432,  419, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(597,432,  419, 'à', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(597,432,  419, 'á', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(663,432,  419, 'â', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(907,432,  420, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(732,432,  421, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(944,432,  422, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(838,432,  423, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(981,432,  424, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(941,432,  425, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1019,432, 426, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(977,432,  427, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,299, 428, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1012,432, 429, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,228, 430, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1073,432, 431, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,140, 432, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,371, 433, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116, 26, 434, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,257, 435, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,180, 435, 'à', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116,140, 437, ' ', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(82,   432,  499, 'Anglel', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116, 432,  499, 'Angler', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(579,  432,  499, 'Ladderc1', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(579,  378,  499, 'Ladderc2', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(82, 177,    499, 'Ladderl1', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(120, 177,   499, 'Ladderl2', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1116, 177,  499, 'Ladderr1', 1));
  AddAud(BSUIR[0][4], TAuditory.Create(1077, 177,  499, 'Ladderr2', 1));

  AssignFile(mapFile[1], 'map1.1.dat');
  AssignFile(mapFile[2], 'map1.2.dat');
  AssignFile(mapFile[3], 'map1.3.dat');
  AssignFile(mapFile[4], 'map1.4.dat');



  for var i := 1 to 4 do
  begin
    Rewrite(mapFile[i]);
    for var j := Low(BSUIR[0][i]) to High(BSUIR[0][i]) do
      Write(mapFile[i], BSUIR[0][i][j]);
    closeFile(mapFile[i]);
  end;
  for var i := 1 to 1000 do
    SetLength(BSUIRGraph[0][i], 0);
  //INDEX => 100*FLOOR+INDEX IN BSUIR[BUILDING]
  //INTERFLOOR CONNECTIONS
  AddEdge(BSUIR[0], BSUIRGraph[0], 139, 247);
  AddEdge(BSUIR[0], BSUIRGraph[0], 141, 249);
  AddEdge(BSUIR[0], BSUIRGraph[0], 143, 251);
  AddEdge(BSUIR[0], BSUIRGraph[0], 139, 350);
  AddEdge(BSUIR[0], BSUIRGraph[0], 141, 352);
  AddEdge(BSUIR[0], BSUIRGraph[0], 143, 354);
  AddEdge(BSUIR[0], BSUIRGraph[0], 139, 446);
  AddEdge(BSUIR[0], BSUIRGraph[0], 141, 448);
  AddEdge(BSUIR[0], BSUIRGraph[0], 143, 450);

  AddEdge(BSUIR[0], BSUIRGraph[0], 247, 350);
  AddEdge(BSUIR[0], BSUIRGraph[0], 249, 352);
  AddEdge(BSUIR[0], BSUIRGraph[0], 251, 354);
  AddEdge(BSUIR[0], BSUIRGraph[0], 247, 446);
  AddEdge(BSUIR[0], BSUIRGraph[0], 249, 448);
  AddEdge(BSUIR[0], BSUIRGraph[0], 251, 450);

  AddEdge(BSUIR[0], BSUIRGraph[0], 350, 446);
  AddEdge(BSUIR[0], BSUIRGraph[0], 352, 448);
  AddEdge(BSUIR[0], BSUIRGraph[0], 354, 450);

  //1ST BUILDING GRAPH
  for var i := 1 to 4 do
  begin
    for var j := 0 to High(BSUIR[0][i]) do
    begin
      for var k := j + 1 to High(BSUIR[0][i]) do
      begin
        distx := Abs(BSUIR[0][i][j].Pos.X - BSUIR[0][i][k].Pos.X);
        disty := Abs(BSUIR[0][i][j].Pos.Y - BSUIR[0][i][k].Pos.Y);
        if ((distx <= 10) or (disty <= 10)) and (distx <= 300) and (disty <= 150) then
        begin
          AddEdge(BSUIR[0], BSUIRGraph[0], i*100 + j, i*100 + k);
        end;
      end;
    end;
  end;
  AssignFile(graphFile, 'graph1.dat');
  rewrite(graphFile);
  for var i := 1 to 1000 do
  begin
    Vertex.size := 0;
    for var j := Low(BSUIRGraph[0][i]) to High(BSUIRGraph[0][i]) do
    begin
      Vertex.Vert[Vertex.size] := BSUIRGraph[0][i][j];
      Inc(Vertex.size);
    end;
    Write(graphFile, Vertex);
  end;
  Close(graphFile);
end.
