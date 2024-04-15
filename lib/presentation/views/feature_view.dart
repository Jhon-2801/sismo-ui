import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:sismo/infraestructure/models/comment/comment_mode.dart';
import 'package:sismo/infraestructure/models/feature/feature_model.dart';
import 'package:sismo/presentation/providers/feature_provider.dart';
import 'package:sismo/presentation/views/home_view.dart';
import 'package:sismo/presentation/widgets/widgets.dart';

class FeatureView extends StatefulWidget {
  final String id;
  const FeatureView({super.key, required this.id});

  @override
  State<FeatureView> createState() => _FeatureViewState();
}

class _FeatureViewState extends State<FeatureView> {
  FeatureModel? feature;
  List<CommentModel>? comment;
  @override
  void initState() {
    super.initState();
    Provider.of<FeatureProvider>(context, listen: false)
        .getfeaturesById(id: widget.id)
        .then(
      (value) {
        if (value == null) {
          context.pushNamed(HomeView.name);
        }
        setState(() {
          feature = value;
        });
      },
    );
    Provider.of<FeatureProvider>(context, listen: false)
        .getComments(id: widget.id)
        .then((value) {
      setState(() {
        if (value == null) {
          context.pushNamed(HomeView.name);
        }
        comment = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final comments = Provider.of<FeatureProvider>(context).comments;
    return Column(
      children: [
        NavBarView(
          name: 'Detalles',
          onPressed: () {
            context.pushNamed(HomeView.name);
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhiteCard(
              width: size.width * 0.6,
              title: 'Detalles del Feature',
              child: Center(
                child: feature == null
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                    : _CustomerDetailBody(feature: feature!),
              ),
            ),
            WhiteCard(
              width: size.width * 0.2,
              title: 'Comentarios',
              child: Center(
                child: comment == null
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                    : _CustomerComment(
                        comments: comments!,
                      ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _CustomerComment extends StatelessWidget {
  final List<CommentModel> comments;

  const _CustomerComment({required this.comments});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                title: CustomCardComment(
                  comment: comment.body,
                  time: comment.createdAt,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              name: 'Crear comentario',
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: const ModalComment(),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

class _CustomerDetailBody extends StatefulWidget {
  final FeatureModel feature;

  const _CustomerDetailBody({required this.feature});

  @override
  State<_CustomerDetailBody> createState() => __CustomerDetailBodyState();
}

class __CustomerDetailBodyState extends State<_CustomerDetailBody> {
  late bool tsunami;
  TextEditingController timeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    tsunami = widget.feature.tsunami;
    timeController.text = widget.feature.time.toString();
  }

  @override
  Widget build(BuildContext context) {
    final featureProvider = Provider.of<FeatureProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Center(
        child: SizedBox(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 30,
                children: [
                  CustomTextFormField(
                    label: 'Title',
                    initialValue: widget.feature.title,
                    onChanged: (value) =>
                        featureProvider.copyWith(title: value),
                  ),
                  CustomDataTime(
                    controller: timeController,
                    onSelectedDate: (selectedDate) {
                      setState(() {
                        var date =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                        timeController.text = date;
                        featureProvider.copyWith(time: timeController.text);
                      });
                    },
                  ),
                  CustomTextFormField(
                      label: 'Magnitude',
                      initialValue: "${widget.feature.magnitude}",
                      onChanged: (value) {
                        if (value.isEmpty || value != '') {
                          featureProvider.copyWith(magnitude: int.parse(value));
                        }
                      }),
                  CustomTextFormField(
                    label: 'Place',
                    initialValue: widget.feature.place,
                    onChanged: (value) =>
                        featureProvider.copyWith(place: value),
                  ),
                  CustomTextFormField(
                    label: 'Mag_type',
                    initialValue: widget.feature.magType,
                    onChanged: (value) =>
                        featureProvider.copyWith(magType: value),
                  ),
                  CustomTextFormField(
                    label: 'Longitud',
                    initialValue: "${widget.feature.longitude}",
                    onChanged: (value) {
                      if (value.isEmpty || value != '') {
                        featureProvider.copyWith(magnitude: int.parse(value));
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: 'Latitud',
                    initialValue: "${widget.feature.latitude}",
                    onChanged: (value) {
                      if (value.isEmpty || value != '') {
                        featureProvider.copyWith(magnitude: int.parse(value));
                      }
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: const EdgeInsets.only(left: 15),
                    height: 60,
                    width: 335,
                    child: Row(
                      children: [
                        Checkbox(
                            value: tsunami,
                            onChanged: (value) {
                              setState(() {
                                tsunami = !tsunami;
                                featureProvider.copyWith(tsunami: value);
                              });
                            }),
                        const Text('Tsunami')
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        name: 'Actualizar',
                        onPressed: () {
                          featureProvider.updatefeatures();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
