import LLVMC

@frozen
public struct LLVMOpaqueType: LLVMType {
    
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
    public init(_ type: LLVMHalfType) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMFloatType) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMDoubleType) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public init(_ type: LLVMVoidType) {
        self._rawType = type._rawType
        self._context = type._context
    }
    
    @inlinable
    public var opaqueType: LLVMOpaqueType { self }
}
