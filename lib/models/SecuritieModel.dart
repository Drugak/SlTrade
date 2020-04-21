class SecuritieModel {
  String rev;
  String ticker;
  String classificationcode;
  String classificationname;
  String issueprice;
  String rid;
  String currencycode;
  String depoidname;
  String lot;
  String issueamount;
  String issuername;
  String nominal;
  String step;
  String isin;
  String frac;

  SecuritieModel(
      {this.rev,
      this.ticker,
      this.classificationcode,
      this.classificationname,
      this.issueprice,
      this.rid,
      this.currencycode,
      this.depoidname,
      this.lot,
      this.issueamount,
      this.issuername,
      this.nominal,
      this.step,
      this.isin,
      this.frac});

  SecuritieModel.fromJson(Map<String, dynamic> json) {
    rev = json['rev'];
    ticker = json['ticker'];
    classificationcode = json['classificationcode'];
    classificationname = json['classificationname'];
    issueprice = json['issueprice'];
    rid = json['rid'];
    currencycode = json['currencycode'];
    depoidname = json['depoidname'];
    lot = json['lot'];
    issueamount = json['issueamount'];
    issuername = json['issuername'];
    nominal = json['nominal'];
    step = json['step'];
    isin = json['isin'];
    frac = json['frac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rev'] = this.rev;
    data['ticker'] = this.ticker;
    data['classificationcode'] = this.classificationcode;
    data['classificationname'] = this.classificationname;
    data['issueprice'] = this.issueprice;
    data['rid'] = this.rid;
    data['currencycode'] = this.currencycode;
    data['depoidname'] = this.depoidname;
    data['lot'] = this.lot;
    data['issueamount'] = this.issueamount;
    data['issuername'] = this.issuername;
    data['nominal'] = this.nominal;
    data['step'] = this.step;
    data['isin'] = this.isin;
    data['frac'] = this.frac;
    return data;
  }
}