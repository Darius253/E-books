class Order {
  int? orderId;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? customerAddress;
  String? orderNotes;
  List<OrderItem>? orderItems;
  OrderPayment? orderPayment;

  Order({
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.customerAddress,
    this.orderNotes,
    this.orderItems,
    this.orderPayment,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      customerAddress: json['customer_address'],
      orderNotes: json['order_notes'],
      orderItems: List<OrderItem>.from(
          json['orderItems'].map((item) => OrderItem.fromJson(item))),
      orderPayment: json['orderPayment'] != null
          ? OrderPayment.fromJson(json['orderPayment'])
          : null,
    );
  }
}

class OrderItem {
  String? titleOfBook;
  int? quantity;
  String? authorId;
  double? salePrice;
  int? bookApproved;
  String? status;
  int? itemBookId;
  int? bookId;
  int? ordersItemsId;
  int? itemOrderId;
  String? featuredImageUrl;
  String? fileUrl;
  double? royaltySalePrice;
  String? authorName;

  OrderItem({
    this.titleOfBook,
    this.quantity,
    this.authorId,
    this.salePrice,
    this.bookApproved,
    this.status,
    this.itemBookId,
    this.bookId,
    this.ordersItemsId,
    this.itemOrderId,
    this.featuredImageUrl,
    this.fileUrl,
    this.royaltySalePrice,
    this.authorName,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      titleOfBook: json['title_of_book'],
      quantity: json['quantity'],
      authorId: json['author_id'],
      salePrice: json['sale_price'].toDouble(),
      bookApproved: json['book_approved'],
      status: json['status'],
      itemBookId: json['item_book_id'],
      bookId: json['book_id'],
      ordersItemsId: json['orders_items_id'],
      itemOrderId: json['item_order_id'],
      featuredImageUrl: json['featured_image_url'],
      fileUrl: json['file_url'],
      royaltySalePrice: json['royalty_sale_price'].toDouble(),
      authorName: json['author_name'],
    );
  }
}

class OrderPayment {
  int? orderpaymentId;
  String? createdAt;
  String? updatedAt;
  int? paymentOrderId;
  int? orderPaymentId;
  double? originalAmount;
  String? transactionId;
  double? amountAfterCharges;
  double? charges;
  String? paidCurrency;

  OrderPayment({
    this.orderpaymentId,
    this.createdAt,
    this.updatedAt,
    this.paymentOrderId,
    this.orderPaymentId,
    this.originalAmount,
    this.transactionId,
    this.amountAfterCharges,
    this.charges,
    this.paidCurrency,
  });

  factory OrderPayment.fromJson(Map<String, dynamic> json) {
    return OrderPayment(
      orderpaymentId: json['orderpayment_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      paymentOrderId: json['payment_order_id'],
      orderPaymentId: json['order_payment_id'],
      originalAmount: json['original_amount'].toDouble(),
      transactionId: json['transaction_id'],
      amountAfterCharges: json['amount_after_charges'].toDouble(),
      charges: json['charges'].toDouble(),
      paidCurrency: json['paid_currency'],
    );
  }
}
