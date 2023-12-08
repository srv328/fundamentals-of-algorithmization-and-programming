#include <iostream>
#include <Windows.h>

using namespace std;

int kol(int x);


int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);

	bool a = false, b = false;
	unsigned long x = 0;
	int k = 0;

	cout << "введите число" << endl;
	cin >> x;

	cout << "двоичное представление введенного числа" << endl;

	for (int i = kol(x) - 1; i >= 0; i--)
	{
		b = ((1 << i) & x);
		cout << b;
	}
	cout << endl;
	
	int count = 0;
	
	for (int i = kol(x) - 1; i >= 0; i--)
	{
		count++;
		if (count % 2 == 1) 
			x ^= (1 << i);
		b = ((1 << i) & x);
		cout << b;
	}
	//b = ((1 << i) & x);





	return 0;
}

int kol(int x)
{
	int count = 0;

	while (x != 0)
	{
		x >>= 1;
		count++;
	}
	return count;
}

