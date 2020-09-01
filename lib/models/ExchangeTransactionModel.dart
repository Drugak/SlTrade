class ExchangeTransactionModel {
  String rev;
  String dcc;
  String leave;
  String qty;
  String pric;
  String firm_name;
  String typ;
  String exchange;
  String id;
  String settl_pair;
  String moment;
  String mema;

  ExchangeTransactionModel({
    this.rev,
    this.dcc,
    this.leave,
    this.qty,
    this.pric,
    this.firm_name,
    this.typ,
    this.exchange,
    this.id,
    this.settl_pair,
    this.moment,
    this.mema,
  });

  ExchangeTransactionModel.fromJson(Map<String, dynamic> json) {
    rev = json['rev'];
    dcc = json['dcc'];
    leave = json['leave'];
    qty = json['qty'];
    pric = json['pric'];
    firm_name = json['firm_name'];
    typ = json['typ'];
    exchange = json['exchange'];
    id = json['id'];
    settl_pair = json['settl_pair'];
    moment = json['moment'];
    mema = json['mema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rev'] = this.rev;
    data['dcc'] = this.dcc;
    data['leave'] = this.leave;
    data['qty'] = this.qty;
    data['pric'] = this.pric;
    data['firm_name'] = this.firm_name;
    data['typ'] = this.typ;
    data['exchange'] = this.exchange;
    data['id'] = this.id;
    data['settl_pair'] = this.settl_pair;
    data['moment'] = this.moment;
    data['mema'] = this.mema;
  }
}
