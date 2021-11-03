import 'dart:io'; 
enum Emotion{
  happy,sad,angry 
}

class Person {
    var name; 
    var age;
    var emo; 

    Person() {
        name = "UnKnownName"; 
        age = 0; 
        emo = Emotion.happy; 
    }
    
    @override
    String toString() {
        var str = "Person<" + name + "," + age.toString() + "," + emo.toString() + ">"; 
        print(str); 
        return str; 
    }
    void getSchedule() async{
        try {
            File wn = new File(name + "_schedule.json"); 
            if(!await wn.exists()) {    //throw excption if file isn't exists. 
                throw Exception('FileNotFoundException'); 
            }
            var json_str = '{"name":"' + name + '",';  
            json_str += '"age": "' + age.toString() + '",'; 
            json_str += '"emo":"' + emo.toString() + '"}'; 
            wn.writeAsString(json_str); 
        }
        catch(e) {
            print(e);
        }
    }
}

void main() {
  var p = new Person(); 
  p.toString(); 
  p.getSchedule(); 
}