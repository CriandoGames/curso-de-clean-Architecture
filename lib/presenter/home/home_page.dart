import 'package:curso_clear_arch/presenter/home/home_controller.dart';
import 'package:curso_clear_arch/presenter/home/store/phase_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({required this.controller, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mini Curso de Clean Architecture',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: widget.controller,
            builder: (context, state, _) {
              if (state is PhaseInitial) {
                return BodyWidget(widget: widget);

                //inicial
              } else if (state is PhaseLoading) {
                return const CircularProgressIndicator();

                //sucess
              } else if (state is PhaseSuccess) {
                return BodySucess(
                  widget: widget,
                  state: state,
                );

                //fail
              } else if (state is PhaseFailure) {
                return BodyFailure(
                  widget: widget,
                  state: state,
                );
              } else {
                return const Text('Erro desconhecido');
              }
            },
          ),
        ),
      ),
    );
  }
}

class BodyFailure extends StatelessWidget {
  const BodyFailure({
    super.key,
    required this.widget,
    required this.state,
  });

  final HomePage widget;
  final PhaseFailure state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.error),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            widget.controller.getAdvice();
          },
          child: const Text(
            'Tentar novamente',
          ),
        ),
      ],
    );
  }
}

class BodySucess extends StatelessWidget {
  const BodySucess({
    super.key,
    required this.widget,
    required this.state,
  });

  final HomePage widget;
  final PhaseSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.message.msg, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.controller.getAdvice();
          },
          child: const Text('Obter outra dica'),
        ),
        TextButton(
          onPressed: () {
            widget.controller.reset();
          },
          child: const Text('Resetar'),
        ),
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Clique no botão para obter uma dica'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.controller.getAdvice();
          },
          child: const Text('Obter outra dica'),
        ),
      ],
    );
  }
}
