#include <iostream>
using namespace std;
void dec_to_binary(int chislo){
    string binary;
    while(chislo){
        binary.insert(0, 1,(char)chislo % 2+'0');
        chislo >>= 1;
    }
    cout << "Число в двоичном представлении: " << binary << endl;
}
int main(){
    int number;
    cout<<"Введите число: ";
    cin>>number;
    dec_to_binary(number);
}