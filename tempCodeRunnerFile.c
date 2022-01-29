#include <stdio.h>

int main(void) {
  
    char sexo;
    int idade, qtidadedelivros2013, totalMulheres = 0;
    int quantidadedepessoas=0, soma=0, media=0, naoleram=0;
    float percentual=0;
    printf("Digite a idade do entrevistado (ou um valor negativo para finalizar): ");
    scanf("%d", &idade);

    while(idade >= 0){
        quantidadedepessoas++;
        printf("\nDigite o sexo do entrevistado (F- Feminino ou M- Masculino): ");
        scanf(" %c", &sexo);

        printf("\nDigite a quantidade de livros lidos pelo entrevistado: ");
        scanf("%d", &qtidadedelivros2013);
        if(qtidadedelivros2013 == 0){
            naoleram++;
        }  
        for(int i=0; i<quantidadedepessoas; i++){
            soma = soma + qtidadedelivros2013;
        }
        media = soma/quantidadedepessoas;
        if( (sexo == 'F' || sexo == 'f') && qtidadedelivros2013 >= 3)
            totalMulheres = totalMulheres + 1; 

            printf("\nDigite a idade do proximo entrevistado (ou um valor negativo para finalizar): ");
            scanf("%d", &idade);    
        printf("%d\n", naoleram);
    }
    percentual = (naoleram*100)/quantidadedepessoas;
    printf("\nO percentual das pessoas que nao leram eh: %.2f%%", percentual);
    printf("\nA quantidade de pessoas que partciparam da pesquisa foi:%d", quantidadedepessoas);
    printf("\nA quantidade de mulheres que leram 3 livros ou mais foi: %d", totalMulheres);
    printf("\nA media de livros livros pelas pessoas foi: %d", media);
}