class InfoRes {
  String? id;
  String? name;
  String? code;
  String? orderIndex;
  String? imgUrl;
  String? imgUrlPath;
  String? parentId;
  String? parent;
  String? tType;
  String? remarks;
  String? active;
  String? companyId;
  String? branchId;
  String? faId;
  String? userId;
  String? updateDate;
  String? isDelete;

  InfoRes(
      {this.id,
      this.name,
      this.code,
      this.orderIndex,
      this.imgUrl,
      this.imgUrlPath,
      this.parentId,
      this.parent,
      this.tType,
      this.remarks,
      this.active,
      this.companyId,
      this.branchId,
      this.faId,
      this.userId,
      this.updateDate,
      this.isDelete});

  InfoRes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    code = json['Code'];
    orderIndex = json['OrderIndex'];
    imgUrl = json['ImgUrl'];
    imgUrlPath = json['ImgUrlPath'];
    parentId = json['ParentId'];
    parent = json['Parent'];
    tType = json['TType'];
    remarks = json['Remarks'];
    active = json['Active'];
    companyId = json['CompanyId'];
    branchId = json['BranchId'];
    faId = json['FaId'];
    userId = json['UserId'];
    updateDate = json['UpdateDate'];
    isDelete = json['IsDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['OrderIndex'] = this.orderIndex;
    data['ImgUrl'] = this.imgUrl;
    data['ImgUrlPath'] = this.imgUrlPath;
    data['ParentId'] = this.parentId;
    data['Parent'] = this.parent;
    data['TType'] = this.tType;
    data['Remarks'] = this.remarks;
    data['Active'] = this.active;
    data['CompanyId'] = this.companyId;
    data['BranchId'] = this.branchId;
    data['FaId'] = this.faId;
    data['UserId'] = this.userId;
    data['UpdateDate'] = this.updateDate;
    data['IsDelete'] = this.isDelete;
    return data;
  }
}
