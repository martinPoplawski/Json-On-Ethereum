var allPeople ={}

allPeople.persons = [] 

var vaccines = ["Covid", "Masern", "Mumps", "Poken", "AIDS", "HepatitisB", "HepatitisA", "Malaria", "Ebola", "Husten", "Tod"];
var firstNames = ["Harry","Ross","Bruce","Cook","Carolyn","Morgan","Albert","Walker","Randy","Reed","Larry","Barnes","Lois","Wilson","Jesse","Campbell","Ernest","Rogers","Theresa","Patterson","Henry","Simmons","Michelle","Perry","Frank","Butler","Shirley"];
var lastNames = ["Brooks","Rachel","Edwards","Christopher","Perez","Thomas","Baker","Sara","Moore","Chris","Bailey","Roger","Johnson","Marilyn","Thompson","Anthony","Evans","Julie","Hall","Paula","Phillips","Annie","Hernandez","Dorothy","Murphy","Alice","Howard","Ruth","Jackson", "Debra","Allen","Joseph","Nelson","Carlos","Sanchez","Ralph","Clark","Jean","Alexander","Stephen","Roberts","Eric","Long","Amanda","Scott","Teresa","Diaz","Wanda","Thomas","Jacqueline","Torres","Raymond","Carter","Gerald","Harris"]
var locations = ["Binningen", "Lausen", "Muttenz", "Fribourg", "Basel", "Zurich", "Bern", "Hinterduggingen", "Palma"];             

var counter = 1;
               

const generateSamples = function createPeople(nb){
    console.log("Generating samples...")
    for (var i = 0; i < nb; i++){
        allPeople.persons[i] = createOnePerson();
    }
    return allPeople;
}

function createOnePerson(){
    var personJson = {};
    personJson.personalID = counter.toString();
    counter++;
    personJson.name = firstNames[Math.floor(Math.random() * firstNames.length)].concat(" ").concat(lastNames[Math.floor(Math.random() * lastNames.length)]);
    personJson.birthdate = generateRandomPastDate();
    personJson.vaccines = [];
    for (var i = 0; i < Math.floor(Math.random() * 3) + 1; i++){
        personJson.vaccines[i] = {}
        personJson.vaccines[i].doctor = firstNames[Math.floor(Math.random() * firstNames.length)].concat(" ").concat(lastNames[Math.floor(Math.random() * lastNames.length)]);
        personJson.vaccines[i].date = generateRandomPastDate();
        personJson.vaccines[i].location = locations[Math.floor(Math.random() * locations.length)];
        personJson.vaccines[i].description = vaccines[Math.floor(Math.random() * vaccines.length)];
        personJson.vaccines[i].expiringDate = generateRandomFutureDate();
    }
    return personJson;
}

function generateRandomPastDate(){
    var dayAndMonth = generateRandomMonthAndDay();
    var year = 2020 - Math.floor(Math.random() * 51);
    var dateInString = dayAndMonth.concat("-".concat(year.toString()));
    return dateInString;
}

function generateRandomFutureDate(){
    var dayAndMonth = generateRandomMonthAndDay();
    var year = 2020 + Math.floor(Math.random() * 21);
    var dateInString = dayAndMonth.concat("-".concat(year.toString()));
    return dateInString;
}

function generateRandomMonthAndDay(){
    var month = Math.floor(Math.random() * 12) + 1;
    var day;
    if (month == 2){
        day = Math.floor(Math.random() * 28) + 1;
    }
    else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 10){
        day = Math.floor(Math.random() * 31) + 1;
    }else{
        day = Math.floor(Math.random() * 30) + 1;
    }

    return day.toString().concat("-").concat(month.toString())
}
