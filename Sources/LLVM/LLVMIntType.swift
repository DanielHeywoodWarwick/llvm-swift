public protocol LLVMIntType: LLVMType {
    
    var opaqueIntType: LLVMOpaqueIntType { get }
}

extension LLVMIntType {
    
    @inlinable
    public var opaqueType: LLVMOpaqueType { LLVMOpaqueType(self) }
}
