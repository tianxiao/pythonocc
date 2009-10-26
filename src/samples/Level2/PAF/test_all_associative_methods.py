from OCC.PAF.Context import ParametricModelingContext
from OCC.PAF.Parametric import Parameters

import time

def main():
    p = Parameters()                          # Create a parameters set
    my_context = ParametricModelingContext(p, commit=False)     # Create and initialize a parametric context
    my_context.init_display()                 # start the graphic display
    
    
    # we need to register the operations that are used
    # for concerns of performance, _only_ operations that are registered
    # are associative 

#    my_context.register_operations(my_context.basic_operations,
#                                   my_context.boolean_operations,
#                                   my_context.local_operations,
#                                   my_context.
#                                   )

    for ops in dir(my_context):
        try:
            if ops.split('_')[1] == 'operations':
                print '\n\n****** %s ******\n\n' % ( ops )
                print 'has the following methods:'
                for i in dir(getattr(my_context, ops)):
                    if not i.islower():
                        print i
        except IndexError:
            pass 

    '''
    
    Could be really interesting to make examples here of functions in the GEOM module
    that do not have counter parts in the OCC API
    
    '''

    my_context.start_display()

# Create parameters
    p.X1, p.Y1, p.Z1 = 0,0,0
    p.X2, p.Y2, p.Z2 = 30,30,30
    
    p.X3, p.Y3, p.Z3 = 10,10,-10
    p.X4, p.Y4, p.Z4 = 20,20,40
    
    p.RADIUS         = 1
        
    # points box 1                              
    my_pnt1 = my_context.basic_operations.MakePointXYZ(p.X1,p.Y1,p.Z1, name="Pnt1")   # Create the first point box1
    my_pnt2 = my_context.basic_operations.MakePointXYZ(p.X2,p.Y2,p.Z2, name="Pnt2")   # Create the second point box1
    
    # points box 2
    my_pnt3 = my_context.basic_operations.MakePointXYZ(p.X3,p.Y3,p.Z3, name="Pnt3")   # Create the first point box2
    my_pnt4 = my_context.basic_operations.MakePointXYZ(p.X4,p.Y4,p.Z4, name="Pnt4")   # Create the second point box2
    
    # create boxes
    box1 = my_context.prim_operations.MakeBoxTwoPnt(my_pnt1,my_pnt2,name="Box1", show=True)            # Create the box
    box2 = my_context.prim_operations.MakeBoxTwoPnt(my_pnt3,my_pnt4,name="Box2", show=True)            # Create the box
    
    # boolean subtract box2 from box1 
    booled_box = my_context.boolean_operations.MakeBoolean( box1, box2, 2, name='BooleanBox', show=False)
    
    # add fillets to the booleaned box
    fillet_box = my_context.local_operations.MakeFilletAll( booled_box, p.RADIUS, name='FilletBox', show=True)
    
    # configuring presentations
    pres1, pres2, pres_fillet = my_context.get_presentation(box1), my_context.get_presentation(box2), my_context.get_presentation(fillet_box)
    pres1.SetTransparency(.8); pres1.SetColor(12) 
    pres2.SetTransparency(.8); pres1.SetColor(12)
    pres_fillet.SetColor(1)
    
    for i in range(14,40,5):
        print 'changed parameter p.Z2 from %s to %s' % ( i-1, i )
        tA = time.time() 
        p.Z2 = i
        print 'updating geometry took:', time.time() - tA
    
    for i in range(10,40,5):
        tA = time.time() 
        p.RADIUS = i/10.
        print 'updating geometry took:', time.time() - tA
    
    my_context.start_display()

def profile_main():
     # This is the main function for profiling 
     # We've renamed our original main() above to real_main()
     import cProfile, pstats
     prof = cProfile.Profile()
     prof = prof.runctx("main()", globals(), locals())
     print "<pre>"
     stats = pstats.Stats(prof)
     stats.sort_stats("time")  # Or cumulative
     stats.print_stats(80)  # 80 = how many to print
     # The rest is optional.
     stats.print_callees()
     stats.print_callers()
     print "</pre>"

#profile_main()
main()