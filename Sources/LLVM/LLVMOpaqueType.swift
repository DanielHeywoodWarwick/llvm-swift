import LLVMC

@frozen
public struct LLVMOpaqueType: LLVMType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(_ type: LLVMVoidType) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public var opaqueType: LLVMOpaqueType { self }
}
