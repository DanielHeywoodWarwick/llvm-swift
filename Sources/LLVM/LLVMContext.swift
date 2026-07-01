import LLVMC

@frozen
public struct LLVMContext {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawContext = LLVMContextCreate()
        
        @inlinable
        internal init() {}
        
        @inlinable
        deinit {
            LLVMContextDispose(rawContext)
        }
    }
    
    @usableFromInline
    internal let _storage = _Storage()
    
    @inlinable
    public init() {}
}
