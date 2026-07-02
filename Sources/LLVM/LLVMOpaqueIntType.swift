import LLVMC

@frozen
public struct LLVMOpaqueIntType: LLVMIntType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(_ type: LLVMInt1Type) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMInt8Type) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMInt16Type) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMInt32Type) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMInt64Type) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public var opaqueIntType: LLVMOpaqueIntType { self }
}
