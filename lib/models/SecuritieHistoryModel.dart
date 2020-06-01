class SecuritieHistoryModel {
  String trade_moment;
  String init_quoteid;
  String conf_name;
  String typ;
  String init_pair;
  String init_action;
  String conf_pair;
  String price;
  String affirm_moment;
  String id;
  String rev;
  String stat;
  String quantity;
  String issue_id;
  String conf_quoteid;
  String init_memo;
  String type_ext;
  String incl_yield;
  String volume;
  String market;
  String delivery_date;
  String issue_name;
  String conf_memo;
  String new_delivery_date;
  String conf_action;
  String init_name;
  String isin;

  SecuritieHistoryModel({
    this.trade_moment,
    this.init_quoteid,
    this.conf_name,
    this.typ,
    this.init_pair,
    this.init_action,
    this.conf_pair,
    this.price,
    this.affirm_moment,
    this.id,
    this.rev,
    this.stat,
    this.quantity,
    this.issue_id,
    this.conf_quoteid,
    this.init_memo,
    this.type_ext,
    this.incl_yield,
    this.volume,
    this.market,
    this.delivery_date,
    this.issue_name,
    this.conf_memo,
    this.new_delivery_date,
    this.conf_action,
    this.init_name,
    this.isin,
  });

  SecuritieHistoryModel.fromJson(Map<String, dynamic> json) {
    trade_moment = json['trade_moment'];
    init_quoteid = json['init_quoteid'];
    conf_name = json['conf_name'];
    typ = json['typ'];
    init_pair = json['init_pair'];
    init_action = json['init_action'];
    conf_pair = json['conf_pair'];
    price = json['price'];
    affirm_moment = json['affirm_moment'];
    id = json['id'];
    rev = json['rev'];
    stat = json['stat'];
    quantity = json['quantity'];
    issue_id = json['issue_id'];
    conf_quoteid = json['conf_quoteid'];
    init_memo = json['init_memo'];
    type_ext = json['type_ext'];
    incl_yield = json['incl_yield'];
    volume = json['volume'];
    market = json['market'];
    delivery_date = json['delivery_date'];
    issue_name = json['issue_name'];
    conf_memo = json['conf_memo'];
    new_delivery_date = json['new_delivery_date'];
    conf_action = json['conf_action'];
    init_name = json['init_name'];
    isin = json['isin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trade_moment'] = this.trade_moment;
    data['init_quoteid'] = this.init_quoteid;
    data['conf_name'] = this.conf_name;
    data['typ'] = this.typ;
    data['init_pair'] = this.init_pair;
    data['init_action'] = this.init_action;
    data['conf_pair'] = this.conf_pair;
    data['price'] = this.price;
    data['affirm_moment'] = this.affirm_moment;
    data['id'] = this.id;
    data['rev'] = this.rev;
    data['stat'] = this.stat;
    data['quantity'] = this.quantity;
    data['issue_id'] = this.issue_id;
    data['conf_quoteid'] = this.conf_quoteid;
    data['init_memo'] = this.init_memo;
    data['type_ext'] = this.type_ext;
    data['incl_yield'] = this.incl_yield;
    data['volume'] = this.volume;
    data['market'] = this.market;
    data['delivery_date'] = this.delivery_date;
    data['issue_name'] = this.issue_name;
    data['conf_memo'] = this.conf_memo;
    data['new_delivery_date'] = this.new_delivery_date;
    data['conf_action'] = this.conf_action;
    data['init_name'] = this.init_name;
    data['isin'] = this.isin;
  }
}