﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebForm.ProductService {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ProductService.ProductServiceSoap")]
    public interface ProductServiceSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTableByID", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataTable GetTableByID(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTableByID", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataTable> GetTableByIDAsync(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTable", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataTable GetTable();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTable", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataTable> GetTableAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Search", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataTable Search(string keyword);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Search", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataTable> SearchAsync(string keyword);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Add", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Add(string name, string price, string percentSales, string thumbnail, string color, string trademarkID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Add", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> AddAsync(string name, string price, string percentSales, string thumbnail, string color, string trademarkID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Update", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Update(string id, string name, string price, string percentSales, string thumbnail, string color, string trademarkID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Update", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> UpdateAsync(string id, string name, string price, string percentSales, string thumbnail, string color, string trademarkID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Delete", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Delete(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Delete", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> DeleteAsync(string id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ProductServiceSoapChannel : WebForm.ProductService.ProductServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ProductServiceSoapClient : System.ServiceModel.ClientBase<WebForm.ProductService.ProductServiceSoap>, WebForm.ProductService.ProductServiceSoap {
        
        public ProductServiceSoapClient() {
        }
        
        public ProductServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ProductServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ProductServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ProductServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataTable GetTableByID(string id) {
            return base.Channel.GetTableByID(id);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataTable> GetTableByIDAsync(string id) {
            return base.Channel.GetTableByIDAsync(id);
        }
        
        public System.Data.DataTable GetTable() {
            return base.Channel.GetTable();
        }
        
        public System.Threading.Tasks.Task<System.Data.DataTable> GetTableAsync() {
            return base.Channel.GetTableAsync();
        }
        
        public System.Data.DataTable Search(string keyword) {
            return base.Channel.Search(keyword);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataTable> SearchAsync(string keyword) {
            return base.Channel.SearchAsync(keyword);
        }
        
        public bool Add(string name, string price, string percentSales, string thumbnail, string color, string trademarkID) {
            return base.Channel.Add(name, price, percentSales, thumbnail, color, trademarkID);
        }
        
        public System.Threading.Tasks.Task<bool> AddAsync(string name, string price, string percentSales, string thumbnail, string color, string trademarkID) {
            return base.Channel.AddAsync(name, price, percentSales, thumbnail, color, trademarkID);
        }
        
        public bool Update(string id, string name, string price, string percentSales, string thumbnail, string color, string trademarkID) {
            return base.Channel.Update(id, name, price, percentSales, thumbnail, color, trademarkID);
        }
        
        public System.Threading.Tasks.Task<bool> UpdateAsync(string id, string name, string price, string percentSales, string thumbnail, string color, string trademarkID) {
            return base.Channel.UpdateAsync(id, name, price, percentSales, thumbnail, color, trademarkID);
        }
        
        public bool Delete(string id) {
            return base.Channel.Delete(id);
        }
        
        public System.Threading.Tasks.Task<bool> DeleteAsync(string id) {
            return base.Channel.DeleteAsync(id);
        }
    }
}