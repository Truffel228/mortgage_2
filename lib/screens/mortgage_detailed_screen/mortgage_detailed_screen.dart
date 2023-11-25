import 'package:mortgage/app_router.dart';
import 'package:mortgage/app_theme.dart';
import 'package:mortgage/modles/mortgage.dart';
import 'package:mortgage/modles/loans_change_notifier.dart';
import 'package:mortgage/screens/mortgage_detailed_screen/widgets/loan_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mortgage/screens/mortgage_detailed_screen/widgets/pay_progress.dart';
import 'package:provider/provider.dart';

class MortgageDetailedScreen extends StatefulWidget {
  const MortgageDetailedScreen({super.key, required this.loan});
  final Mortgage loan;

  @override
  State<MortgageDetailedScreen> createState() => _MortgageDetailedScreenState();
}

class _MortgageDetailedScreenState extends State<MortgageDetailedScreen> {
  late final LoansChangeNotifier _loansChangeNotifier;
  late Mortgage _edittedLoan;

  @override
  void initState() {
    super.initState();
    _loansChangeNotifier = context.read<LoansChangeNotifier>();
    _edittedLoan = widget.loan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset('icons/back.svg'),
                  ),
                  const Text(
                    'Loan Info',
                  ),
                  InkWell(
                    onTap: () => context.push(AppRouter.parameters),
                    child: SvgPicture.asset('icons/pencil.svg'),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.loan.alreadyPaid.toString()}\$',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF363636),
                              ),
                            ),
                            Text(
                              '${widget.loan.amount.toString()}\$',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF363636),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        PayProgress(
                          hight: 6,
                          loan: widget.loan,
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Paid',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFC1C1C1),
                              ),
                            ),
                            Text(
                              'Debt',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFC1C1C1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFFF6F6F6),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Current payment',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '${widget.loan.monthlyPayment.toStringAsFixed(2)}\$',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Paid interest',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '0\$',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Remaining interest',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '156.81\$',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total interest',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '156.81\$',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFFF6F6F6),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total fee',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '0\$',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFFF6F6F6),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total insurance',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                        Text(
                          '0\$',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final result =
                            await context.pushNamed<int?>(AppRouter.addPayment);

                        if (result == null) {
                          return;
                        }

                        _edittedLoan.payments.add(result);
                        _loansChangeNotifier.editLoan(
                          widget.loan,
                          _edittedLoan,
                        );

                        context.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const FittedBox(
                          child: Text(
                            'Add Payment',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: FittedBox(
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _loansChangeNotifier.deleteLoan(widget.loan);
                  context.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFfdf2f2),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    'Delete Loan',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
