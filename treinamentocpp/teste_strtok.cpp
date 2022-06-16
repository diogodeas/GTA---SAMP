#include <cstring>
#include <iostream>
#include <cctype>
// using namespace std;
 /* native ExampleNative();
 native Float:ExampleNative2(example_arg_1, bool:example_arg_2, Float:example_arg_3);*/
std::string tipoInt = "int", espaco = " ";

std::string argumento_1(std::string parametro) {
    std::string argA = strlwr(strtok (&parametro[0] , ":"));  // arg1 = example_arg_1
    if (argA=="float" || argA=="bool") {
        argA = argA + " " + strtok(NULL , ",");
        std::cout << argA << std::endl;
    }else {
        argA = "int " + argA;
        std::cout << argA << std::endl;
    }
    return argA;
}

int main() {
    std::string entrada;
	std::string saida;
    // if (file.is_open()) {
    while(getline(std::cin, entrada)) {
            // std::stringstream s(line)
            std::string stringA = strtok(&entrada[0], " ");
            std::cout << stringA  << std::endl;
            stringA = strtok(NULL, ":");
            if(stringA=="Float" || stringA == "bool"){
                stringA[0] = tolower(stringA[0]);
                stringA = stringA + " " + strtok(NULL , "(");
            }else {
                stringA = "int " + stringA;
            }
            
            std::cout << stringA << std::endl;
            
            std::string argumentos = strtok(NULL, ")");
            std::cout<<argumentos<<std::endl;
            if(argumentos.length()!=0) {
                std::cout << stringA << std::endl;
                saida += stringA;
                int contador=0;
                std::string jota;
                jota = ",";
                for(int j=0; j<argumentos.length(); j++){
                    if(argumentos[j] == jota[0]){
                        contador+=1;
                    }
                }
                std::string argA;
                std::string parametro = strlwr(strtok (&argumentos[0] , ","));
                for(int i=0; i<(contador+1); i++){
                    argA="";
                    if(i==0){
                        saida+= "(";
                    } else {
                        saida=+ " ";
                    }
                    if(i == contador){
                        argA = argumento_1(parametro);
                        saida += argA + ")";
                        std::cout<<saida<<std::endl;
                    } else {
                        argA = argumento_1(parametro) + ",";
                        saida += argA;
                        std::cout<<saida<<std::endl;
                    }
                    std::cout<<contador<< i <<std::endl;
                    std::cout<< parametro << std::endl;
                }
            } else {
                saida = stringA;
            }
    }
    std::cout << saida << "\n";

  return 0;
}