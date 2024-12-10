import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/core/components/loader.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubits/note_form_cubit.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubits/note_list_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<NoteFormCubit, NoteFormState>(
              listener: (ctx, state) {
                if(state.isSubmitting){
                  LoaderManager.showLoader(context);
                }else{
                  LoaderManager.hideLoader();
                }
                if(state.isSuccess){
                  context.read<NoteListCubit>().getNotes();
                  context.read<NoteFormCubit>().resetForm();
                }
              })
        ],
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
              ),
              body: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/notes');
                  },
                  child: const Text('Notes Screen')),
            ),
            // Builder(builder: (context) {
            //   final isSubmitting =
            //       context.select((NoteFormCubit cubit) => cubit.state.isSubmitting);
            //   print('Home ${isSubmitting}');
            //   if (!isSubmitting) {
            //     return const SizedBox.shrink();
            //   }
            //   return const Loader();
            // }),
          ],
        ));
  }
}
