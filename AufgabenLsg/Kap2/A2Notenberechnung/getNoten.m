function noten = getNoten()
  INFO ='informatik';
  SEM = 'semester';
  CAD = 'cad';
  noten = { 
     {'Schmidt'}, {SEM,4},     {INFO,1.7}, {CAD,2.0};
     {'Meier'},   {INFO,2.3},  {SEM,7},    {CAD,2.3};       
     {SEM,2},     {'Schmidt'}, {CAD,1.3},  {INFO,2.7}
  };
end