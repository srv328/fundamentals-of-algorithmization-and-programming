#include <iostream>
using namespace std;
void dec_to_binary(int chislo){
    string binary;
    while(chislo){
        if(chislo % 2 == 0 ){
            binary.insert(0,1,'0');
        }    
        else{
           binary.insert(0,1,'1'); 
        } 
        chislo >>= 1;
    }
    cout << binary << endl;
}

int main(){
	cout<<"Введите число";
	int number, num, temp;;
	cin>>number;
	dec_to_binary(number);
	for (int i = 8; i >=0 ; i--)
	{
		temp = (number >> i-1)&1;
		if (i == 0){
			temp = number & 1;
			number >>= 8;
		}
		else {
			temp <<= i - 1;
		}
	    num = num | temp;
	}
	cout << "Артикул: " << number << endl;
	for (int i = 7; i >= 0; i--){
		temp = (num >> i ) & 1;
		if (i == 0){
			temp = num & 1;
		}
		switch (i){
    		case 0:{
    		    cout << "Степень дружелюбности к человеку: ";
    			if (temp == 1) { cout << "можно приручить" << endl; }
    			else { cout << "лучше не связываться" << endl; }
    			break;
    		}
    		case 1:{
    		    cout << "обладает ли магией: ";
    			if (temp == 1) { cout << "Yes" << endl; }
    			else { cout << "No"<<endl;}
    			break;
    		}
    		case 2:{
    		    cout << "токсичность для человека: ";
    			if (temp == 1) { cout << "ядовито" << endl; }
    			else { cout << "безвредно" << endl; }
    			break; 
    		}
    		case 3:{
    		    cout << "наличие крыльев: ";
    			if (temp == 1) { cout << "есть" << endl; }
    			else { cout << "нет" << endl; }
    			break;
    		}
    		case 4:{
    		    cout << "наличие чешуи: ";
    			if (temp == 1) { cout << "есть" << endl; }
    			else { cout << "нет" << endl; }
    			break; 
    		}
    		case 5:{
    		    cout << "наличие клюва: ";
    		    if (temp == 1) { cout << "есть" << endl; }
    		    else { cout << "нет" << endl; }
    		    break; 
    		}
    		case 6:{   
    		    cout << "наличие шерсти: ";
    		    if (temp == 1) { cout << "есть" << endl; }
    		    else { cout << "нет" << endl; }
    		    break; 
    		}
    		case 7:{   
    		    cout << "наличие хвоста: ";
        		if (temp == 1) { cout << "есть" << endl; }
        		else { cout << "нет" << endl; }
    			break;
    		}
		}
	}
}

