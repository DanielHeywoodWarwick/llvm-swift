import LLVMC

@frozen
public struct LLVMContext {
    
    @usableFromInline
    internal final class _Context {
        
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
    internal let _context = _Context()
    
    @inlinable
    public init() {}
}
