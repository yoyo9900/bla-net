\
import 'package:flutter/material.dart';

void main() => runApp(const BlaNetApp());

const Color purple = Color(0xFF7137C8);
const Color deepPurple = Color(0xFF4E238F);
const Color pink = Color(0xFFFF6FAE);
const Color palePink = Color(0xFFFFE8F1);
const Color ink = Color(0xFF241A30);

class BlaNetApp extends StatelessWidget {
  const BlaNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بلا نت | BLA NET',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFAFD),
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
        fontFamily: 'Arial',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class BrandMark extends StatelessWidget {
  final double size;
  const BrandMark({super.key, this.size = 76});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * .30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [pink, purple, deepPurple],
        ),
        boxShadow: [
          BoxShadow(
            color: purple.withOpacity(.24),
            blurRadius: 22,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Center(
        child: Text(
          'B',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * .59,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final phoneController = TextEditingController();
  String countryCode = '+964';

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void continueToChats() {
    final phone = phoneController.text.trim();
    if (phone.length < 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال رقم هاتف صحيح')),
      );
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => OtpPreviewScreen(phone: '$countryCode $phone')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: -90, right: -70, child: _GlowCircle(color: palePink, size: 230)),
            Positioned(bottom: -100, left: -70, child: _GlowCircle(color: const Color(0xFFEDE2FF), size: 250)),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 42, 26, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: BrandMark(size: 92)),
                  const SizedBox(height: 22),
                  const Text('بلا نت', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: deepPurple)),
                  const SizedBox(height: 5),
                  const Text('BLA NET', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, letterSpacing: 4, fontWeight: FontWeight.w800, color: pink)),
                  const SizedBox(height: 18),
                  const Text('قريبون… مهما كانت المسافات', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: ink, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('ابدأ محادثاتك وابقَ على تواصل مع من تحب',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ink.withOpacity(.58))),
                  const SizedBox(height: 42),
                  const Text('رقم الهاتف', textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w800, color: ink)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: purple.withOpacity(.16)),
                    ),
                    child: Row(
                      children: [
                        DropdownButton<String>(
                          value: countryCode,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(value: '+964', child: Text('🇮🇶 +964')),
                            DropdownMenuItem(value: '+966', child: Text('🇸🇦 +966')),
                            DropdownMenuItem(value: '+971', child: Text('🇦🇪 +971')),
                          ],
                          onChanged: (v) => setState(() => countryCode = v ?? '+964'),
                        ),
                        Container(width: 1, height: 30, color: purple.withOpacity(.15)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              hintText: 'أدخل رقم هاتفك',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 56,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [purple, pink]),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: pink.withOpacity(.24), blurRadius: 16, offset: const Offset(0, 7))],
                      ),
                      child: ElevatedButton(
                        onPressed: continueToChats,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: const Text('متابعة', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text('بالمتابعة، أنت توافق على شروط الاستخدام وسياسة الخصوصية.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: ink.withOpacity(.48))),
                  const SizedBox(height: 42),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline, size: 15, color: purple),
                      SizedBox(width: 6),
                      Text('خصوصيتك تهمنا', style: TextStyle(color: purple, fontWeight: FontWeight.w700, fontSize: 12)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowCircle({required this.color, required this.size});
  @override
  Widget build(BuildContext context) => Container(
    width: size, height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(.62)),
  );
}

class OtpPreviewScreen extends StatelessWidget {
  final String phone;
  const OtpPreviewScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('تأكيد رقم الهاتف')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Center(child: BrandMark()),
          const SizedBox(height: 28),
          const Text('أدخل رمز التحقق', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: deepPurple)),
          const SizedBox(height: 10),
          Text('أرسلنا رمزاً إلى $phone (واجهة تجريبية)',
            textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 28),
          const TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 6,
            decoration: InputDecoration(
              hintText: '•  •  •  •  •  •',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: purple, padding: const EdgeInsets.all(16)),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const ChatsScreen()), (route) => false),
            child: const Text('عرض نموذج المحادثات'),
          ),
          const SizedBox(height: 10),
          const Text('ملاحظة: التحقق الحقيقي عبر SMS سيُفعّل عند ربط Firebase.',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black45)),
        ],
      ),
    ),
  );
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  static const people = [
    ('سارة أحمد', 'مرحباً! كيف حالك؟', '10:42', 'SA', true),
    ('محمد', 'أرسل لك صورة ❤️', '09:18', 'M', false),
    ('صديقاتي 🌸', 'نور: نلتقي اليوم؟', 'أمس', '🌸', true),
    ('فاطمة', 'شكراً على الهدية 🥰', 'أمس', 'F', false),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('بلا نت', style: TextStyle(fontWeight: FontWeight.w900, color: deepPurple, fontSize: 24)),
        Text('BLA NET', style: TextStyle(letterSpacing: 2, fontSize: 9, color: pink, fontWeight: FontWeight.bold)),
      ]),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: deepPurple)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: deepPurple)),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: purple,
      foregroundColor: Colors.white,
      onPressed: () {},
      child: const Icon(Icons.chat_bubble_outline),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [purple, pink]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(children: [
              Icon(Icons.favorite, color: Colors.white),
              SizedBox(width: 10),
              Expanded(child: Text('مساحتك الخاصة للتواصل 💜', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Align(alignment: Alignment.centerRight, child: Text('المحادثات', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: ink))),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: people.length,
            separatorBuilder: (_, __) => const Divider(indent: 82, endIndent: 18, height: 1),
            itemBuilder: (context, index) {
              final p = people[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: index.isEven ? palePink : const Color(0xFFEDE2FF),
                  child: Text(p.$4, style: const TextStyle(color: deepPurple, fontWeight: FontWeight.w900)),
                ),
                title: Text(p.$1, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w800, color: ink)),
                subtitle: Text(p.$2, textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(p.$3, style: const TextStyle(fontSize: 11, color: Colors.black45)),
                    const SizedBox(height: 7),
                    if (p.$5) const CircleAvatar(radius: 4, backgroundColor: pink),
                  ],
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatPreviewScreen(name: p.$1))),
              );
            },
          ),
        ),
      ],
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'الدردشات'),
        NavigationDestination(icon: Icon(Icons.people_outline), label: 'الأصدقاء'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'حسابي'),
      ],
    ),
  );
}

class ChatPreviewScreen extends StatelessWidget {
  final String name;
  const ChatPreviewScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Row(children: [
        const CircleAvatar(backgroundColor: palePink, child: Icon(Icons.person, color: purple)),
        const SizedBox(width: 10),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
      actions: const [Icon(Icons.call_outlined), SizedBox(width: 18), Icon(Icons.videocam_outlined), SizedBox(width: 12)],
    ),
    body: Column(
      children: [
        const Expanded(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              BrandMark(size: 58),
              SizedBox(height: 12),
              Text('ابدأ محادثتك الأولى 💜', style: TextStyle(color: deepPurple, fontWeight: FontWeight.bold)),
              Text('هذه شاشة تجريبية — الرسائل الحقيقية ستُربط لاحقاً', style: TextStyle(color: Colors.black45, fontSize: 11)),
            ]),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              const Icon(Icons.add_circle_outline, color: purple, size: 28),
              const SizedBox(width: 10),
              const Expanded(child: TextField(decoration: InputDecoration(hintText: 'اكتب رسالة...', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(22)), borderSide: BorderSide.none), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
              const SizedBox(width: 8),
              CircleAvatar(backgroundColor: purple, child: Icon(Icons.send, color: Colors.white, size: 19)),
            ]),
          ),
        ),
      ],
    ),
  );
}
