class Cd
{
  int maDia;
  String tenDia;
  int theLoai;
  double thoiLuong;
  int soLuong;
  double giaBan;

  Cd({
    required this.maDia,
    required this.tenDia,
    required this.theLoai,
    required this.thoiLuong,
    required this.soLuong,
    required this.giaBan,
  });

  static List<Cd> getCd(int theLoai)
  {
    List<Cd> ls = [];
    Cd cd1 = Cd(
        maDia: 1,
        tenDia: 'Zindagi Na Milegi Dobara',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd1);
    Cd cd2 = Cd(
        maDia: 2,
        tenDia: 'Last Holiday',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd2);
    Cd cd3 = Cd(
        maDia: 3,
        tenDia: 'Shadows of a Hot Summer (Stíny horkého léta)',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd3);
    Cd cd4 = Cd(
        maDia: 4,
        tenDia: 'George Lopez: It''s Not Me, It''s You',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd4);
    Cd cd5 = Cd(
        maDia: 5,
        tenDia: '10 Items or Less',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd5);
    Cd cd6 = Cd(
        maDia: 6,
        tenDia: 'Ollin oppivuodet',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd6);
    Cd cd7 = Cd(
        maDia: 7,
        tenDia: 'Fightville',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd7);
    Cd cd8 = Cd(
        maDia: 8,
        tenDia: 'Uninvited, The',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd8);
    Cd cd9 = Cd(
        maDia: 9,
        tenDia: '976-EVIL II',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd9);
    Cd cd10 = Cd(
        maDia: 10,
        tenDia: 'We''re Not Married!',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd10);
    Cd cd11 = Cd(
        maDia: 11,
        tenDia: 'Titanic',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd11);
    Cd cd12 = Cd(
        maDia: 12,
        tenDia: 'End game',
        theLoai: 4,
        thoiLuong: 120,
        soLuong: 10,
        giaBan: 10000
    );
    ls.add(cd12);
    return ls;
  }

  static List<Cd> searchCD(List<Cd> ls, String key)
  {
    List<Cd> list = [];
    for(Cd a in ls)
      {
        if(a.tenDia.contains(key))
        {
          list.add(a);
        }
      }

    return list;
  }

}