class Turk {
  
  String original;

  Turk(this.original); 
  
  final lat_turk  = const { "x" : "ş", // If you need x, type _x
                            "X" : "Ş",
                            "ù" : "ı",
                            "à" : "ğ" 
                    }; // useful on keyboards containing x, ù, à
  final lat_turk_ = const { "c" : "ç",
                            "C" : "Ç",
                            "g" : "ğ",
                            "i" : "ı",
                            "I" : "İ",
                            "s" : "ş", 
                            "S" : "Ş" 
                    };
  var turkmap = Map(); // to be assigned to lat_turk, or to lat_turk_ if previous char was _
                   
  String translate(){
    StringBuffer sb = StringBuffer("");
    bool is_ = false ; // true iff previous character was "_"
    for  (int i = 0; i < original.length ; i++){ // only way to iterate over a string in Dart :-(
      var ch = original[i] ;
      if (ch == "_")  is_ = true ; // character _ will never be showed in output
      else { 
        if(is_){
          is_ = false ;
          turkmap = lat_turk_ ;
        }
        else turkmap = lat_turk ;
        sb.write(turkmap[ch] ?? ch) ; // operator ?? returns ch if turkmap[ch] is null
      }
    }
    return sb.toString();
  }
}
