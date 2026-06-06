import 'package:e_commerce/features/shop/models/banners_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/images.dart';

class UDummyData {
  static final List<BannerModel> banner = [
    BannerModel(
      imageUrl: UImages.homeBanner1,
      targetScreen: URoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner2,
      targetScreen: URoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner3,
      targetScreen: URoutes.wishList,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner4,
      targetScreen: URoutes.productDetails,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner5,
      targetScreen: URoutes.profile,
      active: true,
    ),
  ];

  /// List of Categories
  static final List<CategoryModel> categories = [
    // Parent Categories
    CategoryModel(
      id: "1",
      name: "Clothes",
      image: UImages.categoriesIconClothes,
      isFeatured: true,
    ),
    CategoryModel(
      id: "2",
      name: "Shoes",
      image: UImages.categoriesIconShoes,
      isFeatured: true,
    ),
    CategoryModel(
      id: "3",
      name: "Cosmetics",
      image: UImages.categoriesIconCosmetics,
      isFeatured: true,
    ),
    CategoryModel(
      id: "4",
      name: "Electronics",
      image: UImages.categoriesIconElectronics,
      isFeatured: true,
    ),
    CategoryModel(
      id: "5",
      name: "Furniture",
      image: UImages.categoriesIconFurniture,
      isFeatured: true,
    ),
    CategoryModel(
      id: "6",
      name: "Sports",
      image: UImages.categoriesIconSports,
      isFeatured: true,
    ),

    /// Clothes Sub Categories
    CategoryModel(
      id: "7",
      name: "Shirts",
      image: UImages.categoriesIconShirt,
      parentId: "1",
    ),
    CategoryModel(
      id: "8",
      name: "Jackets",
      image: UImages.categoriesIconJackets,
      parentId: "1",
    ),
    CategoryModel(
      id: "9",
      name: "Shorts",
      image: UImages.categoriesIconShorts,
      parentId: "1",
    ),

    // Shoes Sub Categories
    CategoryModel(
      id: "10",
      name: "Formal Shoes",
      image: UImages.categoriesIconFormalShoes,
      parentId: "2",
    ),
    CategoryModel(
      id: "11",
      name: "Sports Shoes",
      image: UImages.categoriesIconSportsShoes,
      parentId: "2",
    ),

    /// Cosmetics Sub Categories
    CategoryModel(
      id: "12",
      name: "Face",
      image: UImages.categoriesIconFace,
      parentId: "3",
    ),
    CategoryModel(
      id: "13",
      name: "Hair Oils",
      image: UImages.categoriesIconHair,
      parentId: "3",
    ),
    CategoryModel(
      id: "14",
      name: "Bags",
      image: UImages.categoriesIconBag,
      parentId: "3",
    ),
    CategoryModel(
      id: "15",
      name: "Perfumes",
      image: UImages.categoriesIconPerfume,
      parentId: "3",
    ),
    CategoryModel(
      id: "16",
      name: "Watches",
      image: UImages.categoriesIconWatch,
      parentId: "3",
    ),

    /// Electronics Sub Categories
    CategoryModel(
      id: '17',
      name: 'Gadgets',
      image: UImages.categoriesIconGadgets,
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '18',
      name: 'Laptops',
      image: UImages.categoriesIconLaptops,
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '19',
      name: 'Mobiles',
      image: UImages.categoriesIconMobiles,
      parentId: '4',
      isFeatured: false,
    ),

    /// Furniture
    CategoryModel(
      id: '20',
      name: 'Bed',
      image: UImages.categoriesIconBed,
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '21',
      name: 'Lamps',
      image: UImages.categoriesIconLamps,
      parentId: '5',
      isFeatured: false,
    ),

    /// Sports
    CategoryModel(
      id: '22',
      name: 'Cricket',
      image: UImages.categoriesIconCricket,
      parentId: '6',
      isFeatured: false,
    ),
    CategoryModel(
      id: '23',
      name: 'Soccer',
      image: UImages.categoriesIconSoccer,
      parentId: '6',
      isFeatured: false,
    ),
  ];
}
