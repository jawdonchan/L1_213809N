class Review {
  final String userName;
 // final String userImageUrl;
  final String reviewText;
  final int rating;
  final DateTime reviewDate;

  Review({
    this.userName,
   // this.userImageUrl,
    this.reviewText,
    this.rating,
    this.reviewDate,
  });
}

List<Review> existingReviews = [
  Review(
    userName: "John Doe",
    reviewText: "The food here is delicious and the service is great!",
    rating: 5,
    reviewDate: DateTime.now(),
  ),
  Review(
    userName: "Jane Doe",
    reviewText: "I had a good experience overall, but the portions were small.",
    rating: 4,
    reviewDate: DateTime.now(),
  ),
  Review(
    userName: "Jim Smith",
    reviewText: "The atmosphere was nice but the food was just average.",
    rating: 3,
    reviewDate: DateTime.now(),
  ),
];