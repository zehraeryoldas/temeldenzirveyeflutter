//aradaki ilşkiyi sağlayabilmek adına partları kullanacğız

//part-of öbür class
part of './part_of_learn.dart';

//diyelim özel bir widget eklemek isityoruz ticker provider ekleyelim
//ekledğimiz ticker providerin importunu ana classımız alır yani partoflearn
class _partOfAppBar extends StatelessWidget with PreferredSizeWidget {
  const _partOfAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("a"),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded))],
    );
  }

  //prefferdsize'ı entegre ettiğimiz için bu override geldi.
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
