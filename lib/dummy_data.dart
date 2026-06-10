import 'package:e_commerce/features/shop/models/banners_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/images.dart';

class UDummyData {
  /// List of Banners
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

  /// List of Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      name: 'Nike',
      image: UImages.nikeLogo,
      isFeatured: true,
      productsCount: 6,
    ),
    BrandModel(
      id: '2',
      name: 'Adidas',
      image: UImages.adidasLogo,
      isFeatured: true,
      productsCount: 7,
    ),
    BrandModel(
      id: '3',
      name: 'Apple',
      image: UImages.appleLogo,
      isFeatured: true,
      productsCount: 6,
    ),
    BrandModel(
      id: '4',
      name: 'Bata',
      image: UImages.bataLogo,
      isFeatured: true,
      productsCount: 1,
    ),
    BrandModel(
      id: '5',
      name: 'Bloody',
      image: UImages.bloodyLogo,
      isFeatured: false,
      productsCount: 4,
    ),
    BrandModel(
      id: '6',
      name: 'Breakout',
      image: UImages.breakoutLogo,
      isFeatured: true,
      productsCount: 3,
    ),
    BrandModel(
      id: '7',
      name: 'Dari Mooch',
      image: UImages.dariMoochLogo,
      isFeatured: true,
      productsCount: 8,
    ),
    BrandModel(
      id: '8',
      name: 'Interwood',
      image: UImages.interWoodLogo,
      isFeatured: true,
      productsCount: 6,
    ),
    BrandModel(
      id: '9',
      name: 'HP',
      image: UImages.hpLogo,
      isFeatured: false,
      productsCount: 9,
    ),
    BrandModel(
      id: '10',
      name: 'J.',
      image: UImages.jLogo,
      isFeatured: true,
      productsCount: 10,
    ),
    BrandModel(
      id: '11',
      name: 'NDURE',
      image: UImages.nDURELogo,
      isFeatured: true,
      productsCount: 11,
    ),
    BrandModel(
      id: '12',
      name: 'NorthStar',
      image: UImages.northStarLogo,
      isFeatured: true,
      productsCount: 12,
    ),
    BrandModel(
      id: '13',
      name: 'Polo',
      image: UImages.poloLogo,
      isFeatured: true,
      productsCount: 13,
    ),
  ];

  ///
}
