import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Histórico'),
        ),
        body: Column(
          children: [
            Expanded(
              child: new ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                      15,
                      40,
                      15,
                      40),
                  itemCount: valores.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("$index");
                    return buildProgress(
                        titulo: '${titulos[valores[index]]}',
                        conteudo: '${dataAtualizacao[index]}',
                        detalhesConteudo: '${conteudoDetalhe[valores[index]]}',
                        index: index,
                        valor: valores[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}




buildTopicoTitulo({String texto}) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      texto,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 17,
        fontFamily: 'Open-sans-regular',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: const Color(0xff1f272f),
      ),
    ),
  );
}

buildTopicoConteudo({String texto}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    alignment: Alignment.centerLeft,
    child: Text(
      texto,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'Open-sans-regular',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: Colors.grey,
      ),
    ),
  );
}

buildDetalhesTopico({String texto}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
    alignment: Alignment.centerLeft,
    child: Text(
      texto,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'Open-sans-regular',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: Colors.grey,
      ),
    ),
  );
}

List valores = [1,2,3,4,5];

List dataAtualizacao = ['Atualizado 20/06', 'Atualizado 24/05','Atualizado 28/04','Atualizado 10/03','Atualizado 20/02','Atualizado 16/01'];

List titulos = [
  'Recebemos o seu pedido',
  'Poxa, dessa vez não deu :(',
  'Opa! Seu crédito está pré-aprovado',
  'Estamos organizando a sua documentação',
  'Seu pedido foi encaminhado para análise',
  'Seu pedido está em análise',
  'Ops, você tem documentos pendentes',
  'Parabéns, o seu perfil foi aprovado pela Nagro',
  'Crédito liberado com sucesso!',
  'Operação finalizada'
];

List conteudoDetalhe = [
  'Estamos analisando o seu pedido para entender as suas necessidades. É possível que nossa equipe entre em contato com você durante esse período.',
  'Infelizmente dessa vez não conseguimos aprovar o seu crédito. Para saber mais detalhes, entre em contato em nossos canais de atendimento.',
  'Nossa equipe identificou muito potencial no seu negócio! A partir de agora vamos trabalhar juntos para enriquecer o seu perfil e te preparar para as melhores opções de crédito,',
  'Estamos organizando toda a sua documentação para encaminhar para o setor de crédito e iniciar nossa análise profunda. Fique tranquilo que seus dados estão seguros com a gente.',
  'Tudo certo com seus documentos! Encaminhamos o seu pedido para análise de crédito.',
  'Nossa equipe de crédito está realizando uma análise completa de seus documentos e perfil para poder encaminhar o seu pedido para os melhores financiadores.',
  'Identificamos que faltam alguns documentos para nos enviar. Siga novamente nossas instruções e se ficar alguma dúvida, pode contar com a gente.',
  'Aprovamos o seu perfil e encaminhamos para o financiador ideal para o seu negócio. Em breve te retornamos com o resultado o pedido!',
  'Parabéns produtor! Seu crédito foi liberado pelo financiador. Um de nossos consultores entrará em contato com você para te guiar com os próximos passos.',
  'Esta operação de crédito foi finalizada.'
];

var colors = [
  Color(0xff24a875),
  Color(0xffe1174e),
  Color(0xff1565c0),
  Color(0xfff6a027),
  Color(0xff7ac75f),
  Color(0xff8a37ac),
];

var icons = [
  Icon(Icons.backspace),
  Icon(Icons.beenhere),
  Icon(Icons.folder),
  Icon(Icons.thumb_up),
  Icon(Icons.fast_forward),
  Icon(Icons.create_new_folder),
];

buildProgress(
    {String titulo,
      String conteudo,
      String detalhesConteudo,
      int index,
      int valor}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[valor],
            ),
            child: Center(
              child: Container(
                height: 30,
                width: 30,
                child: icons[index],
              ),
            ),
          ),
          index == valores.length - 1
              ? Container()
              : Container(
            height: 110,
            alignment: Alignment.topLeft,
            child: VerticalDivider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      Flexible(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildTopicoTitulo(texto: titulo),
              buildTopicoConteudo(texto: conteudo),
              buildDetalhesTopico(texto: detalhesConteudo),
            ],
          ),
        ),
      )
    ],
  );
}